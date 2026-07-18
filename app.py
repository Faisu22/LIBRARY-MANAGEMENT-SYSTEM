from flask import Flask
from markupsafe import escape

from database import get_connection

app = Flask(__name__)
app.secret_key = "library_secret_key"

def fetch_books():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT id, book_name, author, category, quantity FROM books")
    books = cursor.fetchall()
    cursor.close()
    conn.close()
    return books

@app.route("/")
def home():
    try:
        books = fetch_books()
        if not books:
            books_html = "<p>No books found in the database.</p>"
        else:
            books_html = (
                "<table border='1' cellpadding='5' cellspacing='0'>"
                "<tr><th>ID</th><th>Name</th><th>Author</th><th>Category</th><th>Quantity</th></tr>"
            )
            for book in books:
                books_html += (
                    "<tr>"
                    f"<td>{book['id']}</td>"
                    f"<td>{escape(book['book_name'])}</td>"
                    f"<td>{escape(book['author'])}</td>"
                    f"<td>{escape(book['category'] or '')}</td>"
                    f"<td>{book['quantity']}</td>"
                    "</tr>"
                )
            books_html += "</table>"
        return f"<h2>Library Books</h2>{books_html}"
    except Exception as e:
        return f"<h3>Database Error</h3><p>{escape(str(e))}</p>"

if __name__ == "__main__":
    app.run(debug=True)
