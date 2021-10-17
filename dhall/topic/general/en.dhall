--| General (English)

let Pipitor = ../../Pipitor.dhall
let Feed = Pipitor.Topic.Feed
let Twitter = Pipitor.Topic.Twitter
let youtube = (../../util.dhall).youtube

in [
  -- Latest in Anime News by Crunchyroll!
  Feed "https://feeds.feedburner.com/crunchyroll/animenews",
  -- Latest Crunchyroll Videos
  Feed "https://feeds.feedburner.com/crunchyroll/rss",
  -- Crunchyroll Collection
  youtube "UC6pGDc4bFGD1_36IKv3FnYg",

  Twitter 4827947356, -- @SoundCadence Sound Cadence Studios
  Twitter 3819442460, -- @lootanime lootanime
  Twitter 1505411478, -- @MabiOfficial Mabinogi
  Twitter 709226545, -- @lootcrate Loot Crate
  Twitter 48619486, -- @discotekmedia 💿Discotek Media
  Twitter 28023330, -- @Crunchyroll Crunchyroll
  Twitter 17965667, -- @yenpress Yen Press
]
