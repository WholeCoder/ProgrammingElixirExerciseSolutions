# Exercise: OrganizingAProject-6 

# In the US, NOAA provides hourly 
# XML feeds7 of conditions at 1,800 locations. 

#For example, the 
# feed for a small airport close to where I’m writing this is at 
# http://w1.weather.gov/xml/current_obs/KDTO.xml. Write an application 
# that fetches this data, parses it, and displays it in a nice format.
# (Hint: you might not have to download a library to handle XML 
# parsing)
defmodule ParseWheatherData do
	@user_agent [ {"User-agent", "Elixir dave@pragprog.com"} ]

	def fetch() do
		issues_url
		|> HTTPoison.get(@user_agent)
		|> handle_response
	end

	def issues_url() do
	"http://w1.weather.gov/xml/current_obs/KDTO.xml"
	end

	def handle_response(%{status_code: 200, body: body}), do: { :ok, body }
	def handle_response(%{status_code: ___, body: body}), do: { :error, body }
end
defmodule ExercisesOrganiznigaproject_6Test do
	require Record
  use ExUnit.Case

  Record.defrecord :xmlElement, Record.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlText, Record.extract(:xmlText, from_lib: "xmerl/include/xmerl.hrl")

  test "the truth" do
  	{:ok, xml_data} = ParseWheatherData.fetch()
  	{ xml, _rest } = :xmerl_scan.string(String.to_char_list(xml_data))#:erlang.bitstring_to_list
  	# IO.puts "parsed xml == #{inspect xml_data}"
    credit = get_text_element('/current_observation/credit',xml)
    IO.puts "credit == #{credit}"
  end

  def get_text_element(path,xml) do
    [credit_element] = :xmerl_xpath.string(path,xml)
    # IO.puts "credit_element == #{inspect credit_element}"

    [ credit_text ] = xmlElement(credit_element, :content)
    # IO.puts "credit_text = #{inspect(credit_text)}\n"

    credit = xmlText(credit_text, :value)
  end
  
end
