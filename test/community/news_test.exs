defmodule Community.NewsTest do
  use Community.DataCase

  alias Community.News

  describe "links" do
    alias Community.News.Link

    import Community.NewsFixtures

    @invalid_attrs %{description: nil, url: nil}

    test "list_links/0 returns all links" do
      link = link_fixture()
      assert News.list_links() == [link]
    end

    test "get_link!/1 returns the link with given id" do
      link = link_fixture()
      assert News.get_link!(link.id) == link
    end

    test "create_link/1 with valid data creates a link" do
      valid_attrs = %{description: "some description", url: "some url"}

      assert {:ok, %Link{} = link} = News.create_link(valid_attrs)
      assert link.description == "some description"
      assert link.url == "some url"
    end

    test "create_link/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = News.create_link(@invalid_attrs)
    end

    test "update_link/2 with valid data updates the link" do
      link = link_fixture()
      update_attrs = %{description: "some updated description", url: "some updated url"}

      assert {:ok, %Link{} = link} = News.update_link(link, update_attrs)
      assert link.description == "some updated description"
      assert link.url == "some updated url"
    end

    test "update_link/2 with invalid data returns error changeset" do
      link = link_fixture()
      assert {:error, %Ecto.Changeset{}} = News.update_link(link, @invalid_attrs)
      assert link == News.get_link!(link.id)
    end

    test "delete_link/1 deletes the link" do
      link = link_fixture()
      assert {:ok, %Link{}} = News.delete_link(link)
      assert_raise Ecto.NoResultsError, fn -> News.get_link!(link.id) end
    end

    test "change_link/1 returns a link changeset" do
      link = link_fixture()
      assert %Ecto.Changeset{} = News.change_link(link)
    end
  end

  describe "articles" do
    alias Community.News.Article

    import Community.NewsFixtures

    @invalid_attrs %{body: nil, title: nil}

    test "list_articles/0 returns all articles" do
      article = article_fixture()
      assert News.list_articles() == [article]
    end

    test "get_article!/1 returns the article with given id" do
      article = article_fixture()
      assert News.get_article!(article.id) == article
    end

    test "create_article/1 with valid data creates a article" do
      valid_attrs = %{body: "some body", title: "some title"}

      assert {:ok, %Article{} = article} = News.create_article(valid_attrs)
      assert article.body == "some body"
      assert article.title == "some title"
    end

    test "create_article/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = News.create_article(@invalid_attrs)
    end

    test "update_article/2 with valid data updates the article" do
      article = article_fixture()
      update_attrs = %{body: "some updated body", title: "some updated title"}

      assert {:ok, %Article{} = article} = News.update_article(article, update_attrs)
      assert article.body == "some updated body"
      assert article.title == "some updated title"
    end

    test "update_article/2 with invalid data returns error changeset" do
      article = article_fixture()
      assert {:error, %Ecto.Changeset{}} = News.update_article(article, @invalid_attrs)
      assert article == News.get_article!(article.id)
    end

    test "delete_article/1 deletes the article" do
      article = article_fixture()
      assert {:ok, %Article{}} = News.delete_article(article)
      assert_raise Ecto.NoResultsError, fn -> News.get_article!(article.id) end
    end

    test "change_article/1 returns a article changeset" do
      article = article_fixture()
      assert %Ecto.Changeset{} = News.change_article(article)
    end
  end
end
