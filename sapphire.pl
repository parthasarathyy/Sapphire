use Audio::MPD;
use warnings;
use strict;
use Gtk2;

my $mpc = Audio::MPD->new(
  {
	host => "localhost",
	port => 6600,
	alias => "mpc",
  }
);

# Action subroutine definitions ----
sub play 
{
	$mpc->play;
}

sub pause
{
	$mpc->pause;
}

sub next
{
	$mpc->next;
}

sub prev
{
	$mpc->prev;
}
sub stop
{
	$mpc->stop;
}
# End subroutine definitions ----

# Main GTK instances.
Gtk2->init;
my $mainWindow = Gtk2::Window->new('toplevel');
# End GTK instances.
my $buttons = Gtk2::VBox->new("buttons");
# Button definitions.
my $playButton = Gtk2::Button->new("Play");
my $pauseButton = Gtk2::Button->new("Pause");
my $nextButton = Gtk2::Button->new("Next");
my $prevButton = Gtk2::Button->new("Previous");
my $stopButton = Gtk2::Button->new("Stop");

$playButton->signal_connect(clicked => \&play);
$pauseButton->signal_connect(clicked => \&pause);
$nextButton->signal_connect(clicked => \&next);
$prevButton->signal_connect(clicked => \&prev);
$stopButton->signal_connect(clicked => \&stop);

$buttons->add($playButton); 
$buttons->add($pauseButton); 
$buttons->add($nextButton);
$buttons->add($prevButton);
$buttons->add($stopButton);

$mainWindow->add($buttons);

$mainWindow->show();
$playButton->show();
$pauseButton->show();
$nextButton->show();
$prevButton->show();
$stopButton->show();
$buttons->show();

Gtk2->main;


	
  
