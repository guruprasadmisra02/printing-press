PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    phone TEXT,
    role TEXT CHECK(role IN ('customer','worker','owner')),
    username TEXT,
    password TEXT
);

CREATE TABLE IF NOT EXISTS orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER NOT NULL,
    product_name TEXT NOT NULL,
    size TEXT,
    colour TEXT,
    quantity REAL NOT NULL,
    date TEXT NOT NULL,
    total_cost REAL,
    amount_paid REAL,
    status TEXT CHECK(status IN ('Pending','In Progress','Completed')) DEFAULT 'Pending',
    receive_date TEXT,
    FOREIGN KEY (customer_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS stock (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    item_name TEXT NOT NULL,
    item_no TEXT,
    quantity REAL NOT NULL,
    unit_cost REAL NOT NULL,
    size TEXT,
    total_amount REAL NOT NULL,
    last_updated TEXT
);

CREATE TABLE IF NOT EXISTS stock_additions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    item_name TEXT,
    item_no TEXT,
    quantity REAL,
    unit_cost REAL,
    total_amount_added REAL,
    date_added TEXT
);

CREATE TABLE IF NOT EXISTS order_items_used (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER NOT NULL,
    stock_item_id INTEGER NOT NULL,
    quantity_used REAL NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (stock_item_id) REFERENCES stock(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS expenses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    expense_name TEXT NOT NULL,
    amount REAL NOT NULL,
    description TEXT,
    date TEXT NOT NULL
);
