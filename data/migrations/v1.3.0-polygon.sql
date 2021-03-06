UPDATE
  planet_osm_polygon p
  SET mz_poi_min_zoom = mz_calculate_min_zoom_pois(p.*)
  WHERE
    (tags -> 'leisure' = 'garden' OR
     tags -> 'landuse' = 'village_green' OR
     tags -> 'natural' IN ('wood', 'forest'))
    AND COALESCE(mz_poi_min_zoom, 999) <> COALESCE(mz_calculate_min_zoom_pois(p.*), 999);
