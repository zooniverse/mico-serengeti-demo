namespace :report do
  desc "Print KPI measures based on analysed data"
  task :kpi => :environment do
    subjects = Subject.finished.includes(:consensus)
    report = Report.new(subjects)
    report.calculate
  end
end
