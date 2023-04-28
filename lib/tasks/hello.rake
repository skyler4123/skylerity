task :hello, [:name] => :environment do |name, args|
  puts "Hello #{args}"
  puts "Hello #{name}"
  puts "Hello #{args.name}"
end
