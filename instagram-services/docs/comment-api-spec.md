# Comment api spec

## Add Comment
endpoint : Post /v1/api/comment
Request Body :
```json
{
  "username": "rinrin",
  "commentText": "Forem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis ?",
  "postId": "1"
}
```

Response body success :
```json
{
  "data": {
    "id": "3befad99-ab84-4cfa-8858-817811dd63b1",
    "postId": "1",
    "commentText": "lorem ipsum lorem ipsum lorem ipsum lorem lorem ipsum lorem ipsum lorem ipsum lorem lorem lorem ApiResponse ipsum lorem lorem lorem ",
    "username": "rinrin",
    "createdAt": null
  },
  "errors": null
}
```

Response body error :
```json
{
  "error": "failed add comment"
}
```

## Get Comments
endpoint : Get /v1/api/comments

Response body success :
```json
{
  "data": [
    {
      "id": "11e2d42d-c1f2-4916-8282-c707cda59181",
      "username": "hugo.ny",
      "postId": "7",
      "commentText": "hi hi hi hi hi hi hi hi",
      "createdAt": "2024-09-17T11:42:22"
    },
    {
      "id": "1f530efc-f101-4cd3-9222-90efe64a4ec8",
      "username": "Usman12",
      "postId": "1",
      "commentText": "rrr",
      "createdAt": "2024-09-17T13:17:14"
    },
    {
      "id": "2b1a7188-c296-4ab1-b88e-afa5cc6699fa",
      "username": "marcel.o",
      "postId": "4",
      "commentText": " showModalBottomSheet tidak menampilkan data dengan benar, meskipun data sudah berhasil diparsing, ada beberapa",
      "createdAt": "2024-09-17T12:40:50"
    }
  ],
  "errors": null
}
```

Response body error :
```json
{
  "error": "failed fetch comments"
}
```