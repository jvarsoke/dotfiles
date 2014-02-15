#!/usr/bin/perl -w

main ();

sub main {
   my $filename = shift @ARGV;
   open (FILE, $filename) || die ("Couldn't open $filename\n");
   @addressbook = <FILE>;
   close (FILE);

   foreach (@addressbook) {
      if (/^#/) {
         print "$_";
      }
      elsif (/^.*\t.*\t.*/) {
         @fields = split("\t");
	 chomp(@fields);
	 if ($fields[2] =~ /^[^(]/) {
	    print "whitelist_from  "
	          . "$fields[2]";
	    $fill = 30 - length($fields[2]);
	    if ($fill > 0) {
	       print " " x $fill;
	    }
	    print " #$fields[0]\n";
	 }
      }
   }
}
