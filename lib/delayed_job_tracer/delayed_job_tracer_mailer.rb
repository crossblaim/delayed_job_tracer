class DelayedJobTracerMailer < ActionMailer::Base

  def delayed_job_tracer_test_message
    config      = YAML.load_file(Rails.root.join('config', 'delayed_job_tracer_config.yml'))
    @from       = ActionMailer::Base.smtp_settings[:user_name]
    @recipients = config["monitor"]["username"]
    @subject    = "[DelayedJobTracer] #{Time.zone.now}"
    @sent_on    = Time.zone.now
    @body       = "This is a test message to ensure messages are being delivered successfully via delayed_job."
  end

  def self.enqueue_delayed_job_tracer_test_message
    delay.deliver_delayed_job_tracer_test_message
  end

end