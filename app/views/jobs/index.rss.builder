xml.intruct! :xml, version: "1.0"
xml.rss version: "2.0" do
  xml.channel do
    xml.title "Jobs"
    xml.description "Get jobs from all over the world"
    xml.link root_url

    @jobs.each do |job|
      xml.item do
        xml.title job.title
        xml.description job.description
        xml.link job_url(job)
        xml.pubDate job.created_at
      end
    end
  end
end
