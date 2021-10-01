package com.gg.itbook.modules.shelf.response;

public class BookShelfStatusResponse {
    private boolean isInShelf;

    public boolean isInShelf() {
        return isInShelf;
    }

    public BookShelfStatusResponse(boolean isInShelf) {
        this.isInShelf = isInShelf;
    }

    public void setInShelf(boolean inShelf) {
        isInShelf = inShelf;
    }
}
