# Rubytify

API that brings data through endpoints that consume the Spotify API

## Requirements

- Ruby 2.6.2
- Rails 5.2.3
- Postgresql

##Endpoints

- The endpoint `/api/v1/artists` return all artists ordered by their popularity. with the following fields:

`- id`
`- name`
`- image`
`- genres`
`- popularity`
`- spotify_url`

- The endpoint `/api/v1/artists/:id/albums` return all albums for an artist with the following fields:

`- id`
`- name`
`- image`
`- spotify_url`
`- total_tracks`


- The endpoint `/api/v1/albums/:id/songs` return all songs for an album with the following fields:

`- name`
`- spotify_url`
`- preview_url`
`- duration_ms`
`- explicit`

- The endpoint `/api/v1/genres/:genre_name/random_song` should return a random song that matches the specified genre. The response contain the following fields:

`- name`
`- spotify_url`
`- preview_url`
`- duration_ms`
`- explicit`

#### You can see the deployment of the API in Heroku in the [App](https://rubytify-ror-test.herokuapp.com/api/v1/artists)