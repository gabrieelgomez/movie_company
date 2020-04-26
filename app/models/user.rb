# frozen_string_literal: true

# User class
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable
  include DeviseTokenAuth::Concerns::User
end
