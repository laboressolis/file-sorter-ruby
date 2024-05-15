require 'logger'

$current_dir = Dir.pwd
$folders = ['Documents', 'Audios', 'Videos', 'PDFs', 'Executables', 'Images', 'Archives', 'JARs']

$file_ext = {
  '.doc' => 'Documents',
  '.docx' => 'Documents',
  '.odt' => 'Documents',
  '.txt' => 'Documents',
  '.rtf' => 'Documents',
  '.xls' => 'Documents',
  '.xlsx' => 'Documents',
  '.csv' => 'Documents',
  '.ppt' => 'Documents',
  '.pptx' => 'Documents',
  '.mp3' => 'Audios',
  '.wav' => 'Audios',
  '.aac' => 'Audios',
  '.flac' => 'Audios',
  '.ogg' => 'Audios',
  '.mp4' => 'Videos',
  '.avi' => 'Videos',
  '.mov' => 'Videos',
  '.wmv' => 'Videos',
  '.mkv' => 'Videos',
  '.pdf' => 'PDFs',
  '.exe' => 'Executables',
  '.dmg' => 'Executables',
  '.apk' => 'Executables',
  '.jpg' => 'Images',
  '.jpeg' => 'Images',
  '.png' => 'Images',
  '.gif' => 'Images',
  '.bmp' => 'Images',
  '.tiff' => 'Images',
  '.tif' => 'Images',
  '.psd' => 'Images',
  '.ai' => 'Images',
  '.jfif' => 'Images',
  '.zip' => 'Archives',
  '.rar' => 'Archives',
  '.7z' => 'Archives',
  '.tar' => 'Archives',
  '.gzip' => 'Archives',
  '.jar' => 'JARs'
}

$files = []
$sorted_files = []
$unsorted_files = []
$logger = Logger.new('actions.log')

def folder_setup(folder)
  folder_path = File.join($current_dir, folder)
  if Dir.exist?(folder_path)
    $logger.info "#{folder} folder already exists"
  else
    begin
      Dir.mkdir(folder_path)
      $logger.info "#{folder} folder created"
    rescue StandardError => error
      $logger.error "Failed to create folder #{folder}: #{error}"
    end
  end
end

# https://stackoverflow.com/questions/1755665/get-names-of-all-files-from-a-folder-with-ruby

def get_files
  current_dir_files = Dir.entries($current_dir).select { |f| File.file? File.join($current_dir, f) }
  return current_dir_files
end

def sort(file)
  ext = File.extname(file)
  # idk if works with files having two .s? like .tar.gz
  path = $file_ext[ext] || "Unknown"

  if path == "Unknown"
    $unsorted_files.push(file)
  else
    file_path = File.join($current_dir, file)
    move_path = File.join($current_dir, path, file)
    begin
      File.rename(file_path, move_path)
      if File.exist?(move_path)
        $logger.info "File #{file} moved successfully!"
      else
        $logger.error "Something went wrong: File #{file} move failed."
      end
    rescue StandardError => error
      $logger.error "File #{file} move failed: #{error}"
    end
  end
end


def main
  $logger.info 'Script Started'
  $logger.info "Current Working Directory: #{$current_dir}"

  # folder setup
  $folders.each {|folder| folder_setup(folder)}

  # fetching files
  $logger.info "Fetching files"
  files = get_files
  files.each {|file| sort(file)}


end
if __FILE__ == $PROGRAM_NAME
  main
end
