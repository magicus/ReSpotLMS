package Plugins::ReSpotLMS::Plugin;

use strict;
use warnings;

use base qw(Slim::Plugin::OPMLBased);

use Slim::Utils::Log;
use Slim::Utils::Prefs;
use Slim::Utils::Misc;

my $log = Slim::Utils::Log->addLogCategory({
    'category'     => 'plugin.respotlms',
    'defaultLevel' => 'DEBUG', # 'INFO'
    'description'  => 'PLUGIN_RESPOTLMS',
});

if (main::WEBUI) {
    require Plugins::ReSpotLMS::Settings;
}

my $prefs = preferences('plugin.respotlms');

sub initPlugin {
    my $class = shift;

    $plugin_version = $class->_pluginDataFor('version');

    $log->info("ReSpotLMS: initPlugin() for version " . $plugin_version);

    $class->SUPER::initPlugin(@_);

    if (main::WEBUI) {
        Plugins::ReSpotLMS::Settings->new;
    }
}

sub getDisplayName {
    return 'PLUGIN_RESPOTLMS';
}

sub shutdownPlugin {
    $log->info("ReSpotLMS: shutdownPlugin()");
}

1;
