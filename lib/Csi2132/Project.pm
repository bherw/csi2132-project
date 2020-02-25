package Csi2132::Project;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Load configuration from hash returned by config file
  my $config = $self->plugin('Config');

  # Configure the application
  $self->secrets($config->{secrets});

  # Router
  my $r = $self->routes;
  $r->namespaces(['Csi2132::Project::Controller']);

  # Normal route to controller
  $r->get('/')->to('example#welcome');
}

1;
