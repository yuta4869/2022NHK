% PStill run-time script, F. Siegert, Nov 2004, v1.72.7
% Using S-LANG, see http://www.s-lang.org for details on syntax
% (C) Dipl.-Ing. Frank Siegert, 18. November 2004

% This file is provided in the hop to be useful but without 
% warranty of any kind or fitness for any particular purpose.

% Use this to do specific additions to the PDF annotation engine
% DO NOT TOUCH IT IF YOU DO NOT UNDERSTAND IT EXCEPT FOR THE LINE
% MARKED **** IN CASE OF TROUBLES WITH ANNOTATIONS

% This will check if we are running for the correct PStill version

checkPStillVers("1710");

% Constants

variable NULLTYPE = 0;
variable ANNOTTYPE = 1;
variable LINKTYPE = 2;
variable DESTTYPE = 3;
variable OUTLINETYPE = 4;
variable DOCVIEWTYPE = 5;
variable DOCINFOTYPE = 6;
variable PUTTYPE = 7;

% Global Vars

variable annotstring = "";
variable viewstring = "";
variable hasSubtype = "";
variable hasAction = "";
variable hasCount = 0;
variable filename = "";
variable validAnnotation = 0;
variable specialMark = 0;
variable insertionPage = -1;
variable annotationPage = -1;
variable hasDestination = "";
variable needDestination = 0;
variable isNamedDestination = 0;
variable isOutline = 0;
variable annotationType = NULLTYPE;

% Utility function to produce output for the log file
define myprintf (n)
{
   logprint (Sprintf (n));
}

% Replace all occurances of a string in another string
define str_replace_all (orig, match, replacement)
{
	while (str_replace (orig, match, replacement))
		orig = ();
	return orig;
}

% further utilty functions are

% void objToAnnotation(int pagenumber, string annotation);
% void objToOutline(annotstring);
% void objToName(annotstring);

% addToContent(stringofpdfcommands)

% ------------------------------------------------------------------

% actions are called by PDF engine whenever a special event happens

% action_pdfmark - collects and filters PDF marks (annotations)
% called whenever a pdfmark dicionary entity is worked on
% s is a string and empty on end of dictionary
% n is a integer counter

define action_pdfmark(s,n) {

	% We are called by PStill for every key/value pair in an annotation, we process sequentially
	% one at a time...
	
	% the string s will be zero length at the end of the annoation, so process the collected data
	if (strlen(s) == 0) {
	
		% ****
		% validAnnotation = 0;		% uncomment this line for disabling annotations
		% ****

		% check for PUT operation, this is handled entirely by the backend
		if (annotationType == PUTTYPE) {
			myprintf("PUT annotation: %s\n",annotstring,1);
			objToPage(0 ,annotstring);
			validAnnotation = 0;
		}
		
		% if we are inserting as a DOCINFO or DOCVIEW mark, take the shortcut
		if (specialMark > 0) {
			addDocFX(annotstring, specialMark);
		}

		% otherwise check if the annotation is valid (supported)
		if (validAnnotation > 0) {
			% in case of N-UP our page numbering may be reduced, divide by page count

			if (annotationPageDivider() > 1) {
				if (insertionPage > 1) {
					insertionPage = int(insertionPage / annotationPageDivider());
					if (insertionPage < 1) insertionPage = 1;
				}
				if (annotationPage > 1) {				
					annotationPage = int(annotationPage / annotationPageDivider());
					if (annotationPage < 1) annotationPage = 1;
				}
			}			
		
			% We need to construct a destination for the link
			% #PAGEANNOT=### is a placeholder and will be replaced by dumpPDFBase() by the
			% object number for the ### page object at dumpTime, we take the rest from /View
			variable destination;

			% if we do not yet have seen a subtype we default to /Text (a note)
			if ((strlen(hasSubtype) == 0) and (isOutline == 0) and (isNamedDestination == 0)) {		
				annotstring = strcat(annotstring,"\n/Subtype /Text");
				needDestination++;	% Text annots need to have a /Dest(ination) page
			}

			% if we need a Destination (and there is no need for Actions), add it to the annotation
			if ((needDestination > 0) and (strlen(hasAction) == 0) and (strlen(filename) == 0)) {
				if (strlen(hasDestination) > 0) {
					destination="";
				} else {					
				 if (strlen(viewstring) > 0) {   % defining a view, if so - use it!
					destination = Sprintf("\n/Dest [ #PAGEANNOT=%d %s", insertionPage, viewstring ,2 );
				 } else {
				 	% outline but not view defined, default to "/Fit" to page
				 	if (isOutline > 0) {
				 		destination = Sprintf("\n/Dest [ #PAGEANNOT=%d /Fit ]", insertionPage ,1 );
				 	} else {
						destination = Sprintf("\n/Dest [ #PAGEANNOT=%d ]", insertionPage ,1 );
					}
				 }	
				}
			} else {
				destination = "";	% no destination needed
			}
			
			% add the destination to the annotation
			annotstring = strcat(annotstring,destination);

			% myprintf("%s\n", annotstring, 1);
			
			% Switch the cases, first prioriy is 'named destionations' as these go into the /Dest array
			% of the document
		
			if (isNamedDestination > 0) {
				if (strlen(viewstring) > 0) {	% do we define a view, if so - use it!
					annotstring = Sprintf("%s [ #PAGEANNOT=%d %s", hasDestination, insertionPage, viewstring ,3 );
				} else {
					annotstring = Sprintf("%s [ #PAGEANNOT=%d ]", hasDestination, insertionPage ,2 );
				}
				objToName(annotstring);	% add the annoation to the document named destinations
			} else {	% otherwise
				if (isOutline > 0) {	% check if the annotation defines an outline 
					if (hasCount != 0) {
						objToOutlineCount(annotstring,hasCount);
					} else {
						objToOutline(annotstring);	% if yes, dump to document outline list
					}
				} else {
					if (annotationPage > 0) {
						objToAnnotation(annotationPage,annotstring); % specific page given
					} else {
						if (annotationPageDivider() > 1) {
							variable useThisPageNum;
							
							useThisPageNum = int( curPageNum() / annotationPageDivider() );
							if (useThisPageNum < 1) useThisPageNum = 1;
							
							objToAnnotation(useThisPageNum, annotstring); % otherwise the annotation belongs to the current page
						} else {
							objToAnnotation(curPageNum(),annotstring); % otherwise the annotation belongs to the current page
						}
					}
				}
			}
		}
		% reset to initial state
		annotstring = "";
		viewstring = "";
		hasSubtype = "";
		hasAction = "";
		hasCount = 0;
		hasDestination = "";
		needDestination = 0;
		filename = "";
		validAnnotation = 0;
		isOutline = 0;
		isNamedDestination = 0;
		specialMark = 0;
		insertionPage = -1;
		annotationPage = -1;
		annotationType = NULLTYPE;
		return;
	}
	
	% Otherwise we are still reading the annotation, one key/value pair at the time, so collect...

	% We got the /Page key, we need to remember the target page, then drop the key/value pair
	if (strncmp(s,"/Page",5) == 0) {
		% logprint(substr(s, 6, -1));
		if (strncmp(substr(s, 7, -1),"/Next",5) == 0) {
			insertionPage = curPageNum()+1;
		} else {
			insertionPage = integer( substr(s, 6, -1) );
		}
		needDestination++;
		myprintf("* Target page for annotation is: %d\n",insertionPage,1);
		if (insertionPage > 0) return;
	}
	
	% Is it the /SrcPg key, we need to remember the target page for insertion, then drop key/value pair
	if (strncmp(s,"/SrcPg",6) == 0) {
		% logprint(substr(s, 7, -1));
		if (strncmp(substr(s, 8, -1),"/Next",5) == 0) {
			annotationPage = curPageNum()+1;
		} else {
			annotationPage = integer( substr(s, 8, -1) );
		}
		myprintf("* Put Annotation onto page: %d\n",annotationPage,1);
		if (annotationPage > 0) return;
	}

	% Is it the /View key, we need to remember the target location, then drop key/value pair
	if (strncmp(s,"/View",5) == 0) {
		viewstring = substr(s, 8, -1);
		return;
	}

	% Is it a Subtype, if so check if we run for a Destination, then take over literally
	if (strncmp(s,"/Subtype",8) == 0) {
		% define which kind of subtype needs a destination
		if (string_match(s,"/Link",1)) {
			needDestination++;
		}
		if (string_match(s,"/Text",1)) {
			needDestination++;
		}
		hasSubtype = s;
	}

	% Is it a Destination, if so get it for later processing (insertion) when placing the mark
	if (strncmp(s,"/Dest",5) == 0) {
		hasDestination = substr(s, 7, -1);
	}

	% Is it a Count, if so remember it for later processing
	if (strncmp(s,"/Count",6) == 0) {
		hasCount = integer( substr(s, 8, -1) );
	}

	% I will never understand why Adobe need to convert the /Color key to /C, but if it pleases them, lets do it...
	if (strncmp(s,"/Color",6) == 0) {
		% change /Color to /C
		s = Sprintf("/C %s",substr(s, 8, -1),1);
	}

	% I will never understand why Adobe need to convert the /ModData key to /M, but if it pleases them, lets do it...
	if (strncmp(s,"/ModDate",8) == 0) {
		% change /ModDate to /M
		s = Sprintf("/M %s",substr(s, 10, -1),1);
	}

	% Is it a File, if so remember the file name for later processing
	if (strncmp(s,"/File",5) == 0) {
		% remember a file for later action
		filename = substr(s, 7, -1);
		return;
	}
	
	% Now check if we are working on a ANNOT type, we need to change some keys in this case (again don't ask why ;))
	if (annotationType == ANNOTTYPE) {
		% Looks like Reader needs the /Title key replaced by /T, so do it
		if (strncmp(s,"/Title ",7) == 0) {
			s = str_replace_all (s, "/Title ", "/T ");	% sanitize Subtype
		}
		% Looks like Reader needs any Newline reference "\n" replaced by "\r", so do it
		if (strncmp(s,"/Contents",9) == 0) {
			s = str_replace_all (s, "\\n", "\\r");	% sanitize Content, Acrobat wants backslash-r
		}

	}
	
	% Is it an Action key, if so lets rewrite it before insertion
	% Action processing is a bit tricky, we need to see if the /Action name already has its dict with it
	if (strncmp(s,"/Action",7) == 0) {
		if (strncmp(s,"/Action /",9) == 0) {	% no dict, must be subtype
			s = Sprintf("/A << /S %s ",substr(s, 9, -1),1);  % build the subtype, named /S
			if (strlen(filename) > 0) {
				% myprintf("* File Link to page: %d\n",insertionPage,1);
				s = strcat(s, Sprintf("/F %s ",filename,1)); % add a file if any
				if (insertionPage > 0) {
					s = strcat(s, Sprintf("/D [ %d /Fit ] ",insertionPage - 1, 1)); 
				} else {
					s = strcat(s, "/D [ 0 /Fit ] "); 
				}
			}
			s = strcat(s,">>"); % close the dict
		} else {
			s = Sprintf("/A %s",substr(s, 9, -1),1);
			s = str_replace_all (s, "/Subtype", "/S");	% sanitize Subtype
			hasAction = s;
		}
	}

	% End of special cases, now simply add the key/value pair, or if it is the first key/value, check the type
	if (strlen(annotstring) > 0) {
		% be sure to set a newline before adding anything new
		annotstring = strcat(annotstring,"\n");
	} else {
		% We are first in line, lets see what is going gone here...

		% First, set the current page as default target page
		if (insertionPage < 0) insertionPage = curPageNum();

		% Then select the proper Annotation type
		
		% Is it an Outline Type
		if (strcmp(s,"/OUT") == 0) {
			annotationType = OUTLINETYPE;
			validAnnotation++;
			s = "";
			isOutline++;
		}
		
		% Is it an Dest(ination) Type
		if (strcmp(s,"/DEST") == 0) {
			annotationType = DESTTYPE;
			validAnnotation++;
			isNamedDestination++;
			s = "";
		}
		
		% Is it a LINK Type (we process only old style LNK at the moment)
		if (strcmp(s,"/LNK") == 0) {
			annotationType = LINKTYPE;
			validAnnotation++;
			s = "/Type /Annot\n/Subtype /Link";
		}
		
		% Is it an ANN(OT) Type
		if (strcmp(s,"/ANN") == 0) {
			annotationType = ANNOTTYPE;
			validAnnotation++;
			s = "/Type /Annot";
			% DEBUG OUTPUT myprintf("Got ANN\n",0);
		}
		
		% Is it a DOCVIEW Type
		if (strcmp(s,"/DOCVIEW") == 0) {
			annotationType = DOCVIEWTYPE;
			specialMark=1;
		}
		
		% Is it a DOCINFO Type
		if (strcmp(s,"/DOCINFO") == 0) {
			annotationType = DOCINFOTYPE;
			specialMark=2;
		}

		% Is it a PUT Type, handled by backend
		if (strcmp(s,"/PUT") == 0) {
			s = "";
			annotationType = PUTTYPE;
		}
	}

	% add current key/value pair to current annotation
	annotstring = strcat(annotstring,s);
	
	
	% Drop out, PStill will call us again if more Key/value pairs are given for a single Annotation
}

% SPECIAL UTILS

% action_pagestart - called on start of each page description
define action_pagestart() {
	% addToContent(" % Start me up\n");	% Add some PDF commands at the start of the page content
	% of course you can easily add some annotations also automatically at this point
}

% action_pageend - called on end of each page description
define action_pageend() {
	% addToContent(" % End me down\n");	% Add some PDF commands at the end of the page content
	% of course you can easily add some annotations also automatically at this point
}

% END OF CONTROL SCRIPT
