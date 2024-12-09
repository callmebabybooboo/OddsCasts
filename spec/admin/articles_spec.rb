require "rails_helper"

describe "Articles management" do
    it "allows creating an article" do
        # user enters admin page
        visit "/admin"
        # click btn new article
        click_button("new_article")
        # fill in article detail
        fill_in("title", with: "RubyOnRails")
        fill_in("description", with: "Rails is a full-stack framework. It ships with all the tools needed to build amazing web apps on both the front and back end.")
        fill_in("cover_url", with: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTWdUeac3VidKruvmUTcqewnVdh_XEjvrrnxQujrVjtugyMoWJawSiLWMBmUEDwd9AGzyzQxTpA5xKGyd7cPeqeBcvJ1dsnBjlaN5insxw")
        # click button create
        click_button("create")
        # user should see an article
        expect(page).to have_content("new article")

    end

    it "lists article" do
        # user enters admin page
        visit "/admin"
        # user should see a list of articles
        expect(page).to have_content(article.title)
    end

    it "allows editing an article" do
        # user enters admin page
        visit "/admin"
        # user select an article to edit
        click_link()
        # user fill in article detail
        fill_in("title", with: "RubyOnRails")
        fill_in("description", with: "Rails is a full-stack framework. It ships with all the tools needed to build amazing web apps on both the front and back end.")
        fill_in("cover_url", with: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTWdUeac3VidKruvmUTcqewnVdh_XEjvrrnxQujrVjtugyMoWJawSiLWMBmUEDwd9AGzyzQxTpA5xKGyd7cPeqeBcvJ1dsnBjlaN5insxw")
        # user saves the article
        click_button("save")
        # user should see updated article
        expect(page).to have_content("edit article")
    end
    
    it "deletes an article" do
        # user enters admin page
        visit "/admin"
        # user select an article to delete
        click_link()
        # user delete the article
        click_button("delete")
        # user should not see article
        
    end
end