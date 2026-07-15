#!/bin/bash
# Run all analytics queries against shiptivity.db

DB="shiptivity.db"

echo "=== Query 1: Daily active users, before/after Kanban release ==="
sqlite3 -header -csv "$DB" "
SELECT
  date(login_timestamp, 'unixepoch') AS day,
  COUNT(DISTINCT user_id) AS daily_active_users,
  CASE
    WHEN date(login_timestamp, 'unixepoch') < '2018-06-02' THEN 'before'
    ELSE 'after'
  END AS period
FROM login_history
GROUP BY day
ORDER BY day;
"

echo ""
echo "=== Query 1b: Average daily active users, before vs after ==="
sqlite3 -header -csv "$DB" "
SELECT
  period,
  AVG(daily_active_users) AS avg_daily_active_users
FROM (
  SELECT
    date(login_timestamp, 'unixepoch') AS day,
    COUNT(DISTINCT user_id) AS daily_active_users,
    CASE
      WHEN date(login_timestamp, 'unixepoch') < '2018-06-02' THEN 'before'
      ELSE 'after'
    END AS period
  FROM login_history
  GROUP BY day
) daily_counts
GROUP BY period;
"

echo ""
echo "=== Query 2: Number of status changes by card ==="
sqlite3 -header -csv "$DB" "
SELECT
  cardID,
  COUNT(*) AS status_change_count
FROM card_change_history
GROUP BY cardID
ORDER BY status_change_count DESC;
"