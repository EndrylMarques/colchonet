# encoding: utf-8

namespace :app do 
	desc "Encripitar todas as senhas que ainda não foram processadas no banco de dados"
	task migrar_senhas: :environment do 
		unless User.attribute_names.include? "password"
			puts "As senhas ja foram migradas, terminado."
			return
		end
	
	User.find_each do |user|
		puts "Migrando usuario #{user.id} #{user.full_name}"

		user.password = unencripted_password
		user.password_confirmation = unencripted_password
		user.save!
		end	
	end 
end