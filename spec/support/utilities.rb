def admin_login
  admin = FactoryGirl.create(:admin)
  login_as(admin, scope: :user)
end

def return_json_body
'{
 "kind": "books#volumes",
 "totalItems": 1,
 "items": [
  {
   "kind": "books#volume",
   "id": "TE7EPQAACAAJ",
   "etag": "kwEyXOOMJZ0",
   "selfLink": "https://www.googleapis.com/books/v1/volumes/TE7EPQAACAAJ",
   "volumeInfo": {
    "title": "Jennifer Has Two Daddies",
    "authors": [
     "Priscilla Galloway"
    ],
    "publisher": "Womens Press",
    "publishedDate": "1985",
    "description": "Jennifer has two daddies, and that\'s just fine; she has one \'real\' daddy, and one \'real\' stepdaddy. But when one daddy goes away on a trip Jennifer is faced with the challenge of learning how to deal with change.",
    "industryIdentifiers": [
     {
      "type": "ISBN_10",
      "identifier": "0889610959"
     },
     {
      "type": "ISBN_13",
      "identifier": "9780889610958"
     }
    ],
    "readingModes": {
     "text": false,
     "image": false
    },
    "pageCount": 32,
    "printType": "BOOK",
    "categories": [
     "Family & Relationships"
    ],
    "contentVersion": "preview-1.0.0",
    "imageLinks": {
     "smallThumbnail": "http://bks3.books.google.com/books?id=TE7EPQAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api",
     "thumbnail": "http://bks3.books.google.com/books?id=TE7EPQAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"
    },
    "language": "en",
    "previewLink": "http://books.google.com/books?id=TE7EPQAACAAJ&dq=isbn:0889610959&hl=&cd=1&source=gbs_api",
    "infoLink": "http://books.google.com/books?id=TE7EPQAACAAJ&dq=isbn:0889610959&hl=&source=gbs_api",
    "canonicalVolumeLink": "http://books.google.com/books/about/Jennifer_Has_Two_Daddies.html?hl=&id=TE7EPQAACAAJ"
   },
   "saleInfo": {
    "country": "US",
    "saleability": "NOT_FOR_SALE",
    "isEbook": false
   },
   "accessInfo": {
    "country": "US",
    "viewability": "NO_PAGES",
    "embeddable": false,
    "publicDomain": false,
    "textToSpeechPermission": "ALLOWED",
    "epub": {
     "isAvailable": false
    },
    "pdf": {
     "isAvailable": false
    },
    "webReaderLink": "http://books.google.com/books/reader?id=TE7EPQAACAAJ&hl=&printsec=frontcover&output=reader&source=gbs_api",
    "accessViewStatus": "NONE",
    "quoteSharingAllowed": false
   },
   "searchInfo": {
    "textSnippet": "Jennifer has two daddies, and that&#39;s just fine; she has one &#39;real&#39; daddy, and one &#39;real&#39; stepdaddy. But when one daddy goes away on a trip Jennifer is faced with the challenge of learning how to deal with change."
   }
  }
 ]
}'
end