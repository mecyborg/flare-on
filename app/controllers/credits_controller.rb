class CreditsController < ApplicationController
before_filter :require_login,  only: [:edit,:update] 
end
