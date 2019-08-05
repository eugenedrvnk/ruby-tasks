require 'open-uri'
require 'uri'
require 'nokogiri'

File.write('history-search.txt',"История запросов:  \n\n") if !File.file?('history-search.txt')

job = gets.chomp
salaries = []
vacancies_rabota_count = 0
vacancies_work_count = 0

def normalize_url str
    URI::encode str
end

rabota = "https://rabota.ua/jobsearch/vacancy_list?keyWords=#{job}&regionId=0&salaryType=1"
rabota = normalize_url rabota
rabota_parsed = Nokogiri::HTML(open(rabota))

rabota_list = rabota_parsed.css('p.fd-beefy-soldier.-price')
rabota_list.each do |item|
    salaries << item.text.to_i*1000
end

vacancies_rabota_count = salaries.length

work = "https://www.work.ua/jobs-#{job}/?advs=1&salaryfrom=3"
work = normalize_url work
work_parsed = Nokogiri::HTML(open(work))
work_list = work_parsed.css('span.normal-weight')
work_list.each do |item|
    salaries << item.css('span')[1].text.to_i
end

p [vacancies_rabota_count, salaries.length]
vacancies_work_count = salaries.length-vacancies_rabota_count

puts "Вакансий проанализировано на rabota.ua = #{vacancies_rabota_count}"
puts "Вакансий проанализировано на work.ua = #{vacancies_work_count}"
puts "Средняя зарплата для вакансии '#{job}' в Украине = #{salaries.inject(:+)/salaries.length} грн."

old_history = File.read('history-search.txt')
File.write('history-search.txt', "Запрос: #{job}\nВакасии:\n - work.ua : #{vacancies_work_count}\n - rabota.ua : #{vacancies_rabota_count}\nСредняя зарплата: #{salaries.inject(:+)/salaries.length} грн.\n#{Time.now.to_s[0..-6]}\n\n#{old_history}")