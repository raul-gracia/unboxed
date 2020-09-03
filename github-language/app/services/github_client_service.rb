class GithubClientService
  include HTTParty
  base_uri 'https://api.github.com'

  def initialize
    @options = { headers: headers }
  end

  def user(username)
    self.class.get("/users/#{username}", @options)
  end

  def repos(username)
    self.class.get("/users/#{username}/repos", @options)
  end

  def languages(username, repo)
    self.class.get("/repos/#{username}/#{repo}/languages", @options)
  end

  private

  def headers
    {
      'Accept' => 'application/vnd.github.v3+json'
    }
  end
end
