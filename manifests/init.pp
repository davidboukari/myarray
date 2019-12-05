# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include myarray
class myarray {
  $dico_list_file = {'/tmp/file1' => 'Content of file1',
                    '/tmp/file2'  => 'Content of file2',
                    '/tmp/file31' => 'Content of file2'
                    }
  $dico_list_file.each | String $filename, String $content | {
    File{$filename:
      ensure  => present,
      owner   => vagrant,
      group   => vagrant,
      content => $content
    }
  }
}
