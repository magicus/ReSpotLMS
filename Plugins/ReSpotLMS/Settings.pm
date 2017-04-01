package Plugins::ReSpotLMS::Settings;

use strict;
use base qw(Slim::Web::Settings);

use Slim::Utils::Log;
use Slim::Utils::Prefs;

my $log   = logger('plugin.respotlms');
my $prefs = preferences('plugin.respotlms');

sub name {
    return Slim::Web::HTTP::CSRF->protectName('PLUGIN_RESPOTLMS');
}

sub page {
    return Slim::Web::HTTP::CSRF->protectURI('plugins/ReSpotLMS/settings/basic.html');
}

sub prefs {
    return ($prefs, 'hostname');
}

sub handler {
    my ($class, $client, $params, $callback, @args) = @_;

    if ($params->{reset}) {
        $prefs->set(pref_hostname => 'Squeezebox');
        $prefs->set(modified => 0);
    }

    my $hostname ='Squeezebox';

    if ($params->{saveSettings}) {
        if ($hostname = $params->{hostname}) {
            $prefs->set(hostname => $hostname);
            $prefs->set(modified => 1);
        }
    }
    return $class->SUPER::handler($client, $params);
}

1;

__END__
