CMD = "dig ns DOMAIN"

def get_nameserver(domain)
	cmd = CMD.gsub("DOMAIN",domain)
	answer_section = `#{cmd}`.split("ANSWER SECTION").last

	nameservers = []
	answer_section.split("\n").each do |line|
		next unless line.include?("NS")
		nameservers << line.chomp.split(' ').last.chop
	end
	nameservers
end

puts get_nameserver(ARGV[0])
