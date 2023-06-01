class TranslatePostJob
  include Sidekiq::Job

  def perform(job_id)
    # Do something
    puts "-" * 20
    puts "TranslatePostJob"
    job = Job.find(job_id)
    # duplicate the job
    new_title = OpenAiService.new(job.title).translate_tile
    new_description = OpenAiService.new(job.description.body).translate_body
    puts "-" * 20
    if job.update!(title: new_title) && job.description.update!(body: new_description.to_s)
      puts "New Job Saved"
    else
      puts "New Job NOT Saved"
      puts new_job.errors.full_messages
    end
  end
end
