if did_filetype()
   finish
endif
if getline(1) =~ '^.*perl'
   setfiletype perl
endif
