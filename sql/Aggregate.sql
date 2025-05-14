SELECT  r.[year]
      ,r.[discipline]
      ,r.[event]
      ,r.[NOC]
      ,r.[place]
      ,r.[medal],
	  --a.gender,
	  AVG(NULLIF(a.[height], 0)) AS height,
	  AVG(NULLIF(a.[weight], 0)) AS [weight],
	  AVG(NULLIF(YEAR(a.dateborn), 0)) AS dateborn,
	  COUNT(*)
  FROM [Olympics].[dbo].[ResultsSourceTmp] r
  JOIN AthleteSt a ON r.athlete_id = a.idT
  WHERE [event] LIKE '%Olympic%' 
  AND r.[year] >=1960
  GROUP BY r.[year]
      ,r.[discipline]
      ,r.[event]
      ,r.[NOC]
      ,r.[place]
      ,r.[medal]
	 -- ,a.gender
ORDER BY   COUNT(*)
