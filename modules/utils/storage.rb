require 'json'

module JSONStorage
  def self.load(name)
    return nil unless Dir.exists?('json')

    path = "./json/#{name}.json"
    JSON.parse(File.read(path))
  end

  def self.save(name, data)
    Dir.mkdir('json') unless Dir.exist?('json')
    path = "./json/#{name}.json"
    File.write(path, JSON.generate(data))
  end
end
