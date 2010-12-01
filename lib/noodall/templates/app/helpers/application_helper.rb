module ApplicationHelper
  include Noodall::ComponentsHelper
  include Noodall::Permalinks
  include Noodall::LayoutHelper


  def main_navigation
    render :partial => 'shared/main_nav',
      :locals => {
        :play_sport_page => Noodall::Node.published.first(:permalink => 'play-sport'),
        :other_roots => Noodall::Node.published.where( :permalink => { :$in =>  ['get-social','all-about-us'] })
      }
  end


  def hero_size
    case @node
    when LandingPage
      '680x300#'
    else
     '440x196#'
    end
  end


  def digg_link(url, html_options = {})
      link_to 'Digg', "http://digg.com/submit?phase=2&amp;url=#{url}", html_options.reverse_merge(:class => 'share-link', :id => 'digg-submit', :title => 'Digg this!')
    end

    def delicious_link(url, html_options = {})
      link_to 'delicious', "http://del.icio.us/post?url=#{url}", html_options.reverse_merge(:class => 'share-link', :id => 'delicious-submit', :title => 'Save to delicious')
    end

    def facebook_link(url, html_options = {})
      link_to 'Facebook', "http://www.facebook.com/sharer.php?u=#{url}", html_options.reverse_merge(:class => 'share-link', :id => 'facebook-submit', :title => 'Share on Facebook')
    end

    def stumble_link(url, html_options = {})
      link_to 'Stumble Upon', "http://www.stumbleupon.com/submit?url=#{url}", html_options.reverse_merge(:class => 'share-link', :id => 'stumble-submit', :title => 'Stumble on this')
    end

    def mail_link(url, html_options = {})
      mail_to nil, "Email", html_options.reverse_merge( :body => url, :class => 'share-link', :id => 'mail-link', :title => 'Email this to a friend')
    end

    def twitter_link(url, html_options = {})
      link_to 'Twitter', "http://twitter.com/home?status=#{url}}", html_options.reverse_merge(:class => 'share-link', :id => 'twitter-submit', :title => 'Tweet this')
    end

    def reddit_link(url, html_options = {})
      link_to 'Reddit', "http://www.reddit.com/submit?url=#{url}", html_options.reverse_merge(:class => 'share-link', :id => 'reddit-submit', :title => 'Reddit this!')
    end

    def technorati_link(url, html_options = {})
      link_to 'Technorati', "http://technorati.com/faves/?add=#{url}", html_options.reverse_merge(:class => 'share-link', :id => 'technorati-submit', :title => 'Technorati this!')
    end

end
