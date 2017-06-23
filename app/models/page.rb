class Page < ApplicationRecord
	validates :url, presence: true
	after_create :parse_content

	def parse_content
		content = {}
		doc = Nokogiri::HTML(open(url))
		%w{ h1 h2 h3 href}.each do |tag|
			content[tag] = tag == "href" ? doc.xpath("//a/@#{tag}").map(&:text) : doc.xpath("//#{tag}").map(&:text)
		end
		self.content = content
		self.save
	end
end
