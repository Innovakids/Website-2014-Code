#---------------------------------------------------------------------
# $Header: /Perl/OlleDB/activeperl-copy.pl 10    08-05-04 15:28 Sommar $
#
# A simple script for installing a binary of OlleDB under ActivePerl 809 and up.
#
# $History: activeperl-copy.pl $
# 
# *****************  Version 10  *****************
# User: Sommar       Date: 08-05-04   Time: 15:28
# Updated in $/Perl/OlleDB
# Added Perl 5.10.
#
# *****************  Version 9  *****************
# User: Sommar       Date: 07-07-10   Time: 21:47
# Updated in $/Perl/OlleDB
# Added support for different architectures.
#
# *****************  Version 8  *****************
# User: Sommar       Date: 06-11-20   Time: 22:14
# Updated in $/Perl/OlleDB
# Use File::Path::mkpath instead of mkdir, to make sure that intermediate
# directories on the path are created as well.
#
# *****************  Version 7  *****************
# User: Sommar       Date: 06-04-17   Time: 21:17
# Updated in $/Perl/OlleDB
# No more MSVCR70, as it is statically linked.
#
# *****************  Version 6  *****************
# User: Sommar       Date: 05-11-27   Time: 17:10
# Updated in $/Perl/OlleDB
# En akutfall av fel accent.
#
# *****************  Version 5  *****************
# User: Sommar       Date: 05-11-26   Time: 23:47
# Updated in $/Perl/OlleDB
# Renamed the module to Win32::SqlServer and advanced to version 2.001.
#
# *****************  Version 4  *****************
# User: Sommar       Date: 05-11-13   Time: 17:22
# Updated in $/Perl/OlleDB
#
# *****************  Version 3  *****************
# User: Sommar       Date: 05-11-13   Time: 16:51
# Updated in $/Perl/OlleDB
#
# *****************  Version 2  *****************
# User: Sommar       Date: 05-11-13   Time: 16:32
# Updated in $/Perl/OlleDB
#
# *****************  Version 1  *****************
# User: Sommar       Date: 05-11-12   Time: 21:55
# Created in $/Perl/OlleDB
#---------------------------------------------------------------------

use strict;
use Config;
use File::Copy;
use File::Path;

sub makedir {
    my($dir) = @_;
    mkpath $dir, 0, 0755;
    if (not -d $dir) {
       die "Failed to create '$dir': $!\n";
    }
}

sub do_copy{
   my($src, $dest) = @_;
   if (-e $dest) {
      system(qq!attrib -r "$dest"!);
      unlink($dest);
   }
   print "Copying $src to $dest\n";
   copy($src, $dest) or die "Could not copy $src: $!\n";
   system(qq!attrib +r "$dest"!);
}

my $perltop = shift(@ARGV);
if (not $perltop) {
   $perltop = $^X;
   if ($perltop =~ /\\/) {
      my @perltop = split(/\\/, $perltop);
      pop(@perltop);
      pop(@perltop);
      $perltop = join('\\', @perltop);
   }
   else {
      my @PATH = split(/;/, $ENV{'PATH'});
      my $progname = $perltop;
      $progname = "$progname.EXE" unless $progname =~ /.exe$/i;
      undef $perltop;
      while (@PATH) {
         if (-e "$PATH[0]\\$progname") {
            $perltop = $PATH[0];
            my @perltop = split(/\\/, $perltop);
            pop(@perltop);
            $perltop = join('\\', @perltop);
            last;
         }
         shift @PATH;
      }
   }
}

my $ver = substr($], 0, 5);

if (not (grep ($_ == $ver, (5.008, 5.010)))) {
   print "You have Perl version $ver, but this install kit includes only binaries\n";
   print "for ActivePerl 8xx (Perl 5.8) and ActivePerl 10xx (Perl 5.10).\n";
   print "You will need to install from sources. See README.html.\n";
   exit 245;
}

# Get the architecture.
my $arch = (split(/-/, $Config{'archname'}))[1];
if ($arch eq 'x64')  {
   $arch = 'AMD64';
}
elsif ($arch ne 'x86') {
   print "You architeture is $Config{'archname'}, and there is no binary for this architecure\n";
   print "You have to build from sources. See README.html. Beware that this module only runs on Windows.\n";
   exit 246;
}

print "Installing Win32::SqlServer in $perltop\n";

my $libdir  = "$perltop\\site\\lib\\Win32";
my $htmldir = "$perltop\\html\\site\\lib\\Win32";
my $autodir = "$perltop\\site\\lib\\auto\\Win32";
makedir($libdir);
makedir($htmldir);
makedir($autodir);
makedir("$autodir\\SqlServer");

do_copy("blib\\arch\\auto\\Win32\\SqlServer\\SqlServer-$arch-$ver.dll",
        "$autodir\\SqlServer\\SqlServer.dll");

do_copy('SqlServer.pm', "$libdir\\SqlServer.pm");

do_copy('Win32-SqlServer.html', "$htmldir\\SqlServer.html");

