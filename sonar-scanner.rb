# run sonar-scanner for all extensions
#
# prerequisites: docker, ruby
#
# extensions have to be in folders with name in the format: mediawiki-extensions-NAME
# example: mediawiki-extensions-3D
#
# execute the command from the folder where all extensions are located
# usage: ruby sonar-scanner.rb

folders = Dir.glob('*').select {|f| File.directory? f}.sort
total = folders.size

# get Sonar API key at https://sonarcloud.io/account/security/
sonar_api_key = 'not-the-real-one'
tmp = '/Users/z/tmp/sonar-scanner-cache'

folders.each_with_index do |folder, index|
  puts '-' * 80
  puts "#{folder} #{index + 1}/#{total} #{(((index + 1) / total.to_f) * 100).round} %"
  puts '-' * 80
  docker_command = "docker run --volume #{Dir.pwd}/#{folder}/log://var/lib/jenkins/log --volume #{tmp}://cache --volume #{Dir.pwd}/#{folder}://src --env SONAR_API_KEY=#{sonar_api_key} --env ZUUL_PROJECT=#{folder} docker-registry.wikimedia.org/releng/java8-sonar-scanner:0.4.0 -X -Dsonar.host.url=https://sonarcloud.io -Dsonar.organization=wmftest -Dsonar.projectKey=#{folder} -Dsonar.projectName=#{folder}"
  puts docker_command
  puts `#{docker_command}`
end
