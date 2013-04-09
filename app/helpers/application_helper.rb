module ApplicationHelper
  def email_to_name(arg)
    split_to_array = (arg.email).split(/@/)
    @name = split_to_array[0]
  end
end
