require "rails_helper"

describe "Articles management", type: :system do
    let!(:article) { Article.create(
        title: "RubyOnRails", 
        description: "Rails is a full-stack framework. It ships with all the tools needed to build amazing web apps on both the front and back end.", 
        cover_url: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTWdUeac3VidKruvmUTcqewnVdh_XEjvrrnxQujrVjtugyMoWJawSiLWMBmUEDwd9AGzyzQxTpA5xKGyd7cPeqeBcvJ1dsnBjlaN5insxw") }

    it "allows creating an article" do
        # user enters admin page
        visit admin_articles_path
        # user want to create new article
        click_button("Create New Article")
        # fill in article detail
        fill_in("title", with: "RubyOnRails")
        fill_in("description", with: "Rails is a full-stack framework. It ships with all the tools needed to build amazing web apps on both the front and back end.")
        fill_in("cover_url", with: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTWdUeac3VidKruvmUTcqewnVdh_XEjvrrnxQujrVjtugyMoWJawSiLWMBmUEDwd9AGzyzQxTpA5xKGyd7cPeqeBcvJ1dsnBjlaN5insxw")
        # click button create
        click_button("Create Article")
        # user should see an article
        expect(page).to have_content("Article was successfully create.")
        expect(page).to have_content("New Article")
    end

    it "lists article" do
        # user enters admin page
        # visit admin_articles_path
        # # user should see a list of articles
        # expect(page).to have_content(article.title)
        # expect(page).to have_content(article.description)
    end

    it "allows editing an article" do
        # user enters admin page
        # visit admin_articles_path
        # # user select an article to edit
        # click_link(article.id)
        # # user fill in article detail
        # fill_in("title", with: "RubyOnRails")
        # fill_in("description", with: "Rails is a full-stack framework. It ships with all the tools needed to build amazing web apps on both the front and back end.")
        # fill_in("cover_url", with: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTWdUeac3VidKruvmUTcqewnVdh_XEjvrrnxQujrVjtugyMoWJawSiLWMBmUEDwd9AGzyzQxTpA5xKGyd7cPeqeBcvJ1dsnBjlaN5insxw")
        # # user saves the article
        # click_button("save")
        # # user should see updated article
        # expect(page).to have_content(article.title)
        # expect(page).to have_content(article.description)
    end

    it "deletes an article" do
        # user enters admin page
        # visit admin_articles_path
        # # user select an article to delete
        # click_link(article.id)
        # # user delete the article
        # click_button("delete")
    end
end