# == Schema Information
#
# Table name: messages
#
#  id      :integer          not null, primary key
#  author  :string(45)
#  content :string(255)
#
# Indexes
#
#  id_UNIQUE  (id) UNIQUE
#

class Message < ApplicationRecord
   establish_connection :grader_bot_support

end
