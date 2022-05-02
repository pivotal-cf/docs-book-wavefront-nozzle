# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.pivotal.io$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.pivotal.io' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}

# r301 %r{/wavefront-nozzle/(?![\d-]+)(.*)}, '/wavefront-nozzle/3-n/$1'
r301 %r{/wavefront-nozzle/4-x/(.*)}, "/wavefront-nozzle/3-x/wavefront-docs"
r301 %r{/wavefront-nozzle/2-x/wavefront-docs}, "/wavefront-nozzle/3-x/wavefront-docs"
