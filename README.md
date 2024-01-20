
# Recipe App

This demo for showing the strenghth point in Combine framework when integrate with Alamofire Third part library and reachability library.

this application workes with new Network layer based on
- Reachability library to check connection before any api requeuest.
- Alamofire for making the networking request.
- Combine framework to send events to Viewmodel or controller.

the Flow i made it with structure Nib File for screen
and the Design architecture MVVM - Combine

- project Structure
    - View "NibFile"
    - View Model
    - controller
    - Model




## API Reference

#### Get all items

```http
  GET /api/items
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `string` | **Required**. Your API key |

#### Get item

```http
  GET https://api.edamam.com/api/recipes/v2
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `type`      | `string` | **Required**. Id of item to fetch |
| `q`      | `string` | **Required**. Id of item to fetch |
| `app_id` | `string` | **Required**. Your API key |



## Deployment

To deploy this project run

```bash
  git clone https://github.com/mohamed930/NewNetworkLayer
  cd direct_of_project
  pod install
```


## Features

- Simple UI
- MVVM - Combine
- Network layer for Api Requests


## Authors

Made by With me
- [@mohamedAli](https://github.com/mohamed930)

