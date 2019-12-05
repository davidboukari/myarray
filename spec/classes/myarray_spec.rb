require 'spec_helper'

describe 'myarray' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      context 'myarray class should compile' do
        it { is_expected.to compile.with_all_deps }
      end

      it {
        is_expected.to contain_class('myarray')
      }

      expected_file = ['/tmp/file1', '/tmp/file31']
      expected_file.each do |file_val|
        it {
          is_expected.to contain_file(file_val)
            .with_ensure('present')
            .with_owner('vagrant')
            .with_group('vagrant')
        }
      end
    end
  end
end
