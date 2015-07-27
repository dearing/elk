class Chef
  class Provider
    class Logstash < Chef::Provider::LWRPBase
      use_inline_resources if defined?(use_inline_resources)

      provides :logstash

      service_name = 'logstash'

      action :install do
        user new_resource.user
        group new_resource.group

        ark service_name do
          checksum new_resource.checksum
          group new_resource.group
          has_binaries new_resource.has_binaries
          owner new_resource.user
          prefix_root new_resource.path
          url new_resource.url
          version new_resource.version
        end

        runit_service service_name do
          default_logger true
          owner new_resource.user
          group new_resource.user
          cookbook new_resource.source
          action [:create, :enable]
        end
      end

      action :remove do
        runit_service service_name do
          action :stop
        end
      end
      ## SERVICE

      action :enable do
        service service_name do
          action :enable
        end
      end

      action :restart do
        service service_name do
          action :restart
        end
      end

      action :start do
        service service_name do
          action :start
        end
      end

      action :stop do
        service service_name do
          action :stop
        end
      end
    end
  end
end