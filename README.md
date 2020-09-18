
# londonmapbot

[![Project Status: Concept – Minimal or no implementation has been done
yet, or the repository is only intended to be a limited example, demo,
or
proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)

Repo for the Twitter bot [@londonmapbot](https://www.twitter.com/londonmapbot). It posts satellite images of random bits of The Big Smoke. Built by [@mattdray](https://twitter.com/mattdray).

On schedule, a [GitHub Action](https://github.com/features/actions) queries the [the Mapbox API](https://docs.mapbox.com/api/maps/#static-images) for a satellite image of random co-ordinates in Greater London and then posts it to Twitter using [{rtweet}](https://docs.ropensci.org/rtweet/).

Posted images are copyright of Mapbox/OpenStreetMap/Maxar. This information is embedded in every image.

This is very much a proof of concept and isn't optimised.