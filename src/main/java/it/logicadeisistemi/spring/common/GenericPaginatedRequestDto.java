package it.logicadeisistemi.spring.common;

public class GenericPaginatedRequestDto<T> extends DtoBase {

    private int index;
    private int pageSize;
    private int numberOfPages;
    private T filtro;

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getNumberOfPages() {
        return numberOfPages;
    }

    public void setNumberOfPages(int numberOfPages) {
        this.numberOfPages = numberOfPages;
    }

    public GenericPaginatedRequestDto(int index, int pageSize, int numberOfPages) {
        this.index = index;
        this.pageSize = pageSize;
        this.numberOfPages = numberOfPages;
    }

    public GenericPaginatedRequestDto() {
    }

    public T getFiltro() {
        return filtro;
    }

    public void setFiltro(T filtro) {
        this.filtro = filtro;
    }

}
