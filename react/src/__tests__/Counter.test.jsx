import React from "react";
import { render, screen, fireEvent } from '@testing-library/react'
import '@testing-library/jest-dom';
import Counter from "../components/Counter";
import { expect, test } from "vitest";

test('prüft die Functionalität der Counter-Komponente', () => {
    render(<Counter />);

    const decButton = screen.getByText("-")
    const incButton = screen.getByText("+")
    const counterButton = screen.getByRole("button", {name:"0"});

    expect(counterButton).toHaveTextContent('0');
    
    fireEvent.click(incButton);
    expect(counterButton).toHaveTextContent('1');
        
    fireEvent.click(decButton);
    expect(counterButton).toHaveTextContent('0');

    fireEvent.click(decButton);
    expect(counterButton).toHaveTextContent('-1');
})