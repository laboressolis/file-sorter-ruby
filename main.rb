require 'fileutils'
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

def folder_setup(folder)
  folder_path = File.join($current_dir, folder)
  puts folder_path
end

def main
  logger = Logger.new('actions.log')

  logger.info 'Script Started'
  logger.info "Current Working Directory: #{$current_dir}"

  $folders.each {|folder| folder_setup(folder)}
end
if __FILE__ == $PROGRAM_NAME
  main
end
