use Audio::MPD;
use warnings;
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
$mainWindow->set_border_width(7);
$mainWindow->set_title("Sapphire");
# End GTK instances.
my $buttons = Gtk2::HBox->new("buttons");
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
$mainWindow->signal_connect(destroy => sub { Gtk2->main_quit; });

Gtk2::Box::pack_start($buttons, $playButton, FALSE, FALSE, 0); 
Gtk2::Box::pack_start($buttons, $pauseButton, FALSE, FALSE, 0); 
Gtk2::Box::pack_start($buttons, $nextButton, FALSE, FALSE, 0);
Gtk2::Box::pack_start($buttons, $prevButton, FALSE, FALSE, 0);
Gtk2::Box::pack_start($buttons, $stopButton, FALSE, FALSE, 0);

$mainWindow->add($buttons);

$mainWindow->show();
$playButton->show();
$pauseButton->show();
$nextButton->show();
$prevButton->show();
$stopButton->show();
$buttons->show();

Gtk2->main;


	
  
