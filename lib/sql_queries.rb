# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_title
  # "SELECT title FROM projects INNER JOIN pledges ON projects.id = pledges.project_id"
  "SELECT projects.title, SUM(pledges.amount)
  FROM pledges
  INNER JOIN projects
  ON pledges.project_id = projects.id
  GROUP BY pledges.project_id
  ORDER BY projects.title ASC;"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
  "SELECT users.name, users.age, SUM(pledges.amount)
  FROM users
  INNER JOIN pledges
  ON pledges.user_id = users.id
  GROUP BY pledges.user_id
  ORDER BY users.name ASC"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal

  "
  SELECT projects.title, SUM(pledges.amount) - projects.funding_goal AS over_goal
  FROM projects
  LEFT OUTER JOIN pledges
  ON pledges.project_id = projects.id
  GROUP BY projects.title
  HAVING over_goal >= 0
  "
  
  # WHERE projects.title = over_goal > 0

  #WHERE cannot be used with aggregate functions so that's why the code was breaking. 
  #Thats the whole reason for the HAVING clause to exist, to be used as a where with aggregate functions

end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_summed_amount
  "
  SELECT users.name, SUM(pledges.amount) AS total_contribution
  FROM users
  INNER JOIN pledges
  ON users.id = pledges.user_id
  GROUP BY users.name
  ORDER BY total_contribution ASC
  "
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  "
  SELECT projects.category, pledges.amount
  FROM projects
  LEFT OUTER JOIN pledges
  ON pledges.project_id = projects.id
  WHERE projects.category = 'music'
  "
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
  "
  SELECT projects.category, SUM(pledges.amount) as total
  FROM projects
  INNER JOIN pledges
  ON pledges.project_id = projects.id
  WHERE projects.category = 'books'

  
  "
end
