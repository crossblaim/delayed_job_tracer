class DelayedJobTracerMailer < ActionMailer::Base

  def delayed_job_tracer_test_message
    config  = YAML.load_file(Rails.root.join('config', 'delayed_job_tracer_config.yml'))
    to      = config['monitor']['username']
    from    = config['alert']['email'] # TODO ActionMailer::Base.smtp_settings[:user_name]
    subject = "[DelayedJobTracer][#{config['app']['name']}] Test message sent at: #{Time.zone.now}"
    message = 'This is a test message to ensure messages are being delivered successfully via delayed_job.'
    mail(:to => to, :from => from, :subject => subject, :return_path => from) do |format|
      format.text { render :text => message }
    end
  end

end
