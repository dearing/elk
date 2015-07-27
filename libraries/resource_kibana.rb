require 'chef/resource'

class Chef
  class Resource
    class Kibana < Chef::Resource::LWRPBase
      resource_name :kibana
      default_action :install
      actions [:install, :remove, :enable, :disable, :restart, :start, :stop]

      attribute :checksum, kind_of: String, default: '6f42d25f337fd49f38e2af81b9ab6e0c987a199a8c0b2e1410d072f812cb4520'
      attribute :group, kind_of: String, default: 'kibana'
      attribute :host, kind_of: String, default: '127.0.0.1'
      attribute :path, kind_of: String, default: '/opt/kibana'
      attribute :port, kind_of: [String, Integer], default: 3000
      attribute :url, kind_of: String, default: 'https://download.elastic.co/kibana/kibana/kibana-4.1.1-linux-x64.tar.gz'
      attribute :user, kind_of: String, default: 'kibana'
      attribute :version, kind_of: String, default: '4.1.1'

      attribute :source, kind_of: String, default: 'elk'
    end
    
    class KibanaConfig < Chef::Resource::LWRPBase
      resource_name :kibana_config
      default_action :create
      actions [:create, :delete]

      attribute :group, kind_of: String, default: 'kibana'
      attribute :kibana_elasticsearch_password, kind_of: String, default: nil
      attribute :user, kind_of: String, default: 'kibana'
      attribute :default_app_id, kind_of: String, default: 'discover'
      attribute :elasticsearch_preserve_host, kind_of: [TrueClass, FalseClass], default: true
      attribute :elasticsearch_url, kind_of: String, default: 'http://localhost:9200'
      attribute :host, kind_of: String, default: '0.0.0.0'
      attribute :kibana_elasticsearch_client_crt, kind_of: String, default: nil
      attribute :kibana_elasticsearch_client_key, kind_of: String, default: nil
      attribute :kibana_elasticsearch_username, kind_of: String, default: nil
      attribute :kibana_index, kind_of: String, default: '.kibana'
      attribute :log_file, kind_of: Integer, default: './kibana.log'
      attribute :pid_file, kind_of: String, default: '/var/run/kibana.pid'
      attribute :ping_timeout, kind_of: Integer, default: 1500
      attribute :port, kind_of: Integer, default: 5601
      attribute :request_timeout, kind_of: Integer, default: 30_000
      attribute :shard_timeout, kind_of: Integer, default: 0
      attribute :ssl_cert_file, kind_of: String, default: nil
      attribute :ssl_key_file, kind_of: String, default: nil
      attribute :source, kind_of: String, default: 'elk'
      attribute :startup_timeout, kind_of: Integer, default: 5000
      attribute :verify_ssl, kind_of: [TrueClass, FalseClass], default: true
    end
  end
end