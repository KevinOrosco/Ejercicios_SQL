--INSERT INTO artists(name)
--VALUES("Bruno Mars")

--INSERT INTO albums(Title,ArtistId)
--VALUES("Bruno Mars album", 276)

--INSERT INTO tracks(name,AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
--VALUES
--("Marry You", 348,1,9, "Bruno Mars", 238000, 354002, 0.99),
--("Just that wey", 348,1,9, "Bruno Mars", 217000, 325990, 0.99),
--("Talking to the Moon", 348,1,9, "Bruno Mars", 220000, 337023, 0.99);

--UPDATE tracks
--SET Bytes = 748399
--WHERE TrackId = 3504

--UPDATE tracks
--SET Bytes = 735255
--WHERE TrackId = 3505

--UPDATE tracks
--SET Bytes = 764450
--WHERE TrackId = 3506

--DELETE FROM tracks WHERE TrackId = 3504 OR TrackId = 3505 OR TrackId = 3506

--DELETE FROM albums WHERE AlbumId = 348

--DELETE FROM artists WHERE ArtistId = 276